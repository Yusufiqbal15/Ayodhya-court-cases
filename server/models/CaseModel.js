const mongoose = require('mongoose');
const caseSchema = require('./caseSchema');

// Create the model only if it hasn't been created yet
module.exports = mongoose.models.Case || mongoose.model('Case', caseSchema);