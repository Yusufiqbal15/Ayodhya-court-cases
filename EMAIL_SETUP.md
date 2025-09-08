# Email Setup Guide for Ayodhya Court System

## Problem Solved ✅

The email sending error has been fixed by:
1. Removing duplicate email configurations
2. Adding proper error handling for missing credentials
3. Providing clear setup instructions

## How to Set Up Email

### 1. Create Environment File

Create a `.env` file in the `server/` directory with the following content:

```env
# Email Configuration
GMAIL_USER=your-email@gmail.com
GMAIL_APP_PASSWORD=your-app-password

# MongoDB Configuration
MONGODB_URI=mongodb://localhost:27017/ayodhya-court

# Server Configuration
PORT=5000
```

### 2. Gmail App Password Setup

**Important:** You cannot use your regular Gmail password. You need an App Password.

#### Steps to get Gmail App Password:

1. **Enable 2-Factor Authentication:**
   - Go to [Google Account Settings](https://myaccount.google.com/)
   - Navigate to Security → 2-Step Verification
   - Enable 2-Step Verification if not already enabled

2. **Generate App Password:**
   - Go to Security → App passwords
   - Select "Mail" as the app
   - Select "Other" as the device
   - Enter a name (e.g., "Ayodhya Court System")
   - Click "Generate"
   - Copy the 16-character password

3. **Use the App Password:**
   - In your `.env` file, use the generated App Password, not your regular password

### 3. Test Email Configuration

After setting up the `.env` file, test the email configuration:

```bash
# Navigate to server directory
cd server

# Start the server
npm start

# Test email configuration (in browser or API client)
GET http://localhost:5000/email-config/test
```

### 4. Expected Response

**If configured correctly:**
```json
{
  "configured": true,
  "valid": true,
  "message": "Email configuration is working"
}
```

**If not configured:**
```json
{
  "configured": false,
  "error": "Email credentials not configured",
  "message": "Please set GMAIL_USER and GMAIL_APP_PASSWORD environment variables",
  "instructions": [
    "1. Create a .env file in the server directory",
    "2. Add your Gmail credentials:",
    "   GMAIL_USER=your-email@gmail.com",
    "   GMAIL_APP_PASSWORD=your-app-password",
    "3. For Gmail, you need to use an App Password, not your regular password",
    "4. Enable 2-factor authentication and generate an App Password in your Google Account settings"
  ]
}
```

## Troubleshooting

### Common Issues:

1. **"Email credentials not configured"**
   - Check if `.env` file exists in `server/` directory
   - Verify environment variable names are correct
   - Restart the server after creating `.env` file

2. **"Invalid credentials"**
   - Ensure you're using App Password, not regular password
   - Verify 2-factor authentication is enabled
   - Check if the email address is correct

3. **"Less secure app access"**
   - Gmail no longer supports less secure apps
   - You must use App Passwords with 2-factor authentication

### Security Notes:

- Never commit `.env` files to version control
- Keep your App Password secure
- App Passwords are specific to the application and can be revoked if compromised

## Email Functionality

Once configured, the system can:
- Send case notifications
- Send email reminders
- Send general emails through the API

## API Endpoints

- `POST /send-email` - Send general emails
- `POST /email-reminders` - Send case reminders
- `GET /email-config/test` - Test email configuration

## Support

If you continue to have issues:
1. Check the server console for detailed error messages
2. Verify your Gmail account settings
3. Ensure the `.env` file is in the correct location
4. Restart the server after making changes
