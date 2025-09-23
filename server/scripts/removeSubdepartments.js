const mongoose = require('mongoose');
require('dotenv').config();

// Connect to MongoDB
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected for cleanup'))
.catch((err) => console.error('MongoDB connection error:', err));

// Get models
const Case = require('../models/CaseModel');
const SubDepartment = mongoose.model('SubDepartment', new mongoose.Schema({
  departmentId: Number,
  name_en: String,
  name_hi: String,
}));

async function removeSubdepartments() {
  try {
    // Get the IDs of the subdepartments to remove
    const subDeptsToRemove = await SubDepartment.find({
      $or: [
        { name_en: { $regex: /halo|sfe/i } }, // case insensitive search for 'halo' or 'sfe'
      ]
    });

    console.log(`Found ${subDeptsToRemove.length} subdepartments to remove`);

    // Remove these subdepartments from any cases that reference them
    for (const subDept of subDeptsToRemove) {
      await Case.updateMany(
        { subDepartments: subDept._id },
        { $pull: { subDepartments: subDept._id } }
      );

      await Case.updateMany(
        { 'subdepartmentEmails.departmentId': subDept._id },
        { $pull: { subdepartmentEmails: { departmentId: subDept._id } } }
      );
    }

    // Delete the subdepartments
    await SubDepartment.deleteMany({
      $or: [
        { name_en: { $regex: /halo|sfe/i } },
      ]
    });

    console.log('Successfully removed subdepartments and their references');
    process.exit(0);
  } catch (error) {
    console.error('Error during cleanup:', error);
    process.exit(1);
  }
}

removeSubdepartments();