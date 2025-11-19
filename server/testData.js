// Function to generate test data for cases
const generateTestCases = async () => {
  const CaseModel = require('./models/CaseModel');
  const testCases = [
    {
      caseNumber: "CN-2025-100747",
      petitionerName: "Ram Kumar",
      respondentName: "State of UP",
      hearingDate: "2025-10-15",
      caseType: "Civil",
      filingDate: new Date("2025-09-15"),
      petitionNumber: "P-2025-001",
      noticeNumber: "N-2025-001",
      writType: "Regular",
      department: 1,
      status: "Pending"
    },
    {
      caseNumber: "CN-2025-564974",
      petitionerName: "Shyam Singh",
      respondentName: "Municipal Corporation",
      hearingDate: "2025-10-20",
      caseType: "Civil",
      filingDate: new Date("2025-09-16"),
      petitionNumber: "P-2025-002",
      noticeNumber: "N-2025-002",
      writType: "Regular",
      department: 1,
      status: "Pending"
    },
    {
      caseNumber: "CN-2025-765606",
      petitionerName: "Lakhan Yadav",
      respondentName: "Development Authority",
      hearingDate: "2025-10-25",
      caseType: "Civil",
      filingDate: new Date("2025-09-17"),
      petitionNumber: "P-2025-003",
      noticeNumber: "N-2025-003",
      writType: "Contempt",
      department: 1,
      status: "Pending"
    }
  ];

  try {
    // Remove existing test cases
    await CaseModel.deleteMany({
      caseNumber: { $in: testCases.map(c => c.caseNumber) }
    });

    // Insert new test cases
    await CaseModel.insertMany(testCases);
    console.log("✅ Test cases inserted successfully");
  } catch (error) {
    console.error("❌ Error inserting test cases:", error);
  }
};

module.exports = { generateTestCases };