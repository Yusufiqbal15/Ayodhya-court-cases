const nodemailer = require('nodemailer');

// Check if environment variables are set
const hasEmailCredentials = process.env.GMAIL_USER && process.env.GMAIL_APP_PASSWORD;

// Enhanced Gmail configuration with fallback options
const emailConfig = hasEmailCredentials ? {
  service: 'gmail',
  auth: {
    user: process.env.GMAIL_USER,
    pass: process.env.GMAIL_APP_PASSWORD
  },
  // Add additional options for better compatibility
  secure: true,
  tls: {
    rejectUnauthorized: false
  }
} : null;

// Create transporter only if credentials are available
const transporter = hasEmailCredentials ? nodemailer.createTransport(emailConfig) : null;

// Test email configuration with detailed error reporting
const testEmailConfig = async () => {
  if (!hasEmailCredentials) {
    console.error('❌ Email credentials not configured. Set GMAIL_USER and GMAIL_APP_PASSWORD environment variables.');
    return false;
  }

  try {
    console.log('🔍 Testing email configuration...');
    console.log('📧 Using email:', process.env.GMAIL_USER);
    
    await transporter.verify();
    console.log('✅ Email configuration is valid');
    return true;
  } catch (error) {
    console.error('❌ Email configuration error:', error.message);
    
    // Provide specific guidance based on error type
    if (error.message.includes('Application-specific password required')) {
      console.error('💡 SOLUTION: You need a Gmail App Password, not your regular password');
      console.error('💡 STEPS:');
      console.error('   1. Go to https://myaccount.google.com/');
      console.error('   2. Enable 2-Step Verification');
      console.error('   3. Generate App Password for "Mail"');
      console.error('   4. Use the 16-character App Password in .env file');
    } else if (error.message.includes('Invalid login')) {
      console.error('💡 SOLUTION: Check your email and password in .env file');
      console.error('💡 Make sure to use Gmail App Password, not regular password');
    }
    
    return false;
  }
};

// Send email function with enhanced error handling
const sendEmail = async (to, subject, html) => {
  if (!hasEmailCredentials) {
    throw new Error('Email credentials not configured. Please set GMAIL_USER and GMAIL_APP_PASSWORD environment variables.');
  }

  try {
    console.log('📧 emailConfig: Starting to send email');
    console.log('📧 emailConfig: Using credentials for:', emailConfig.auth.user);
    
    const mailOptions = {
      from: {
        name: 'District Magistrate Office, Ayodhya',
        address: emailConfig.auth.user
      },
      to: to,
      subject: subject,
      html: html
    };

    console.log('📧 emailConfig: Mail options prepared, sending...');
    const info = await transporter.sendMail(mailOptions);
    console.log('📧 emailConfig: Email sent successfully:', info.messageId);
    return { success: true, messageId: info.messageId };
  } catch (error) {
    console.error('❌ emailConfig: Email sending failed:', error.message);
    
    // Provide specific error messages
    if (error.message.includes('Application-specific password required')) {
      throw new Error('Gmail requires App Password. Please enable 2-factor authentication and generate an App Password.');
    } else if (error.message.includes('Invalid login')) {
      throw new Error('Invalid email credentials. Please check your GMAIL_USER and GMAIL_APP_PASSWORD in .env file.');
    } else {
      throw error;
    }
  }
};

module.exports = {
  transporter,
  sendEmail,
  testEmailConfig,
  emailConfig,
  hasEmailCredentials
};
