const express = require('express');
const router = express.Router();
const CaseModel = require('../models/CaseModel');

router.get('/cases', async (req, res) => {
    try {
        const {
            department,
            subDepartment,
            status,
            writType,
            petitionerName,
            respondentName,
            search,
            page = 1,
            limit = 10,
            includeAll
        } = req.query;

        // Build query conditions
        const query = {};
        if (department) query.department = Number(department);
        if (subDepartment) query.subDepartments = { $in: [subDepartment] };
        if (status) query.status = status;
        if (writType) query.writType = writType;
        if (petitionerName) query.petitionerName = new RegExp(petitionerName, 'i');
        if (respondentName) query.respondentName = new RegExp(respondentName, 'i');
        if (search) {
            query.$or = [
                { caseNumber: new RegExp(search, 'i') },
                { petitionerName: new RegExp(search, 'i') },
                { respondentName: new RegExp(search, 'i') }
            ];
        }

        // If includeAll is true, return all cases without pagination
        if (includeAll === 'true') {
            const cases = await CaseModel.find(query)
                .populate('subDepartments')
                .sort({ filingDate: -1 }); // Sort by filing date, most recent first
            return res.json({ cases });
        }

        // Calculate skip for pagination
        const skip = (Number(page) - 1) * Number(limit);

        // Get cases with pagination
        const [cases, total] = await Promise.all([
            CaseModel.find(query)
                .populate('subDepartments')
                .sort({ filingDate: -1 })
                .skip(skip)
                .limit(Number(limit)),
            CaseModel.countDocuments(query)
        ]);

        res.json({
            cases,
            total,
            page: Number(page),
            totalPages: Math.ceil(total / Number(limit)),
        });
    } catch (error) {
        console.error('Error fetching cases:', error);
        res.status(500).json({ 
            success: false, 
            error: error.message,
            stack: process.env.NODE_ENV === 'development' ? error.stack : undefined
        });
    }
});

module.exports = router;