# Security Policy

## Supported Versions

We release security updates for the following versions of ThothCraft Research mobile app:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take the security of ThothCraft Research seriously. If you discover a security vulnerability, please follow these steps:

### How to Report

**Please do NOT report security vulnerabilities through public GitHub issues.**

Instead, please report them via email to:

**security@thothcraft.com**

Include the following information in your report:

- **Type of vulnerability** (e.g., SQL injection, XSS, authentication bypass)
- **Full description** of the vulnerability
- **Steps to reproduce** the issue
- **Potential impact** of the vulnerability
- **Suggested fix** (if available)
- **Your contact information** for follow-up

### What to Expect

1. **Acknowledgment**: We will acknowledge receipt of your report within 48 hours
2. **Investigation**: We will investigate the issue and determine its severity
3. **Updates**: We will keep you informed of our progress
4. **Resolution**: We aim to resolve critical issues within 7 days
5. **Disclosure**: We will coordinate with you on responsible disclosure

### Responsible Disclosure

We ask that you:

- Give us reasonable time to address the issue before public disclosure
- Do not exploit the vulnerability beyond what is necessary to demonstrate it
- Do not access or modify data that doesn't belong to you
- Act in good faith to avoid privacy violations and service disruptions

### Rewards

While we don't currently have a formal bug bounty program, we:

- Will publicly acknowledge researchers who report vulnerabilities (with their permission)
- May provide swag or other tokens of appreciation for significant findings
- Will consider employment opportunities for exceptional security researchers

## Security Best Practices

### For Users

1. **Keep the app updated** to the latest version
2. **Use strong passwords** for your account
3. **Enable biometric authentication** when available
4. **Don't share credentials** with others
5. **Log out on shared devices**
6. **Report suspicious activity** immediately

### For Developers

1. **Never commit secrets** to the repository
2. **Use environment variables** for sensitive configuration
3. **Validate all input** on client and server
4. **Follow secure coding practices**
5. **Keep dependencies updated**
6. **Review code for security issues** before merging

## Known Security Considerations

### Authentication

- We use JWT tokens for authentication
- Tokens are stored securely using platform-specific secure storage
- Tokens automatically refresh before expiration
- Sessions expire after 7 days of inactivity

### Data Storage

- Sensitive data is encrypted at rest
- We use platform secure storage for credentials
- Local database is encrypted with SQLCipher
- Cache is cleared on logout

### Network Security

- All API communication uses HTTPS/TLS 1.2+
- Certificate pinning is implemented for production
- API keys are never exposed in client code
- Request signing prevents tampering

### Privacy

- We collect minimal personal information
- User data is not shared with third parties
- Analytics are anonymized
- Users can request data deletion

## Security Updates

Security updates will be released as patch versions (e.g., 1.0.1, 1.0.2) and announced via:

- GitHub releases
- In-app notifications
- Email to registered users
- Security advisories page

## Third-Party Dependencies

We regularly audit our dependencies for known vulnerabilities using:

- Dependabot (automated)
- Manual security reviews
- Community vulnerability reports

To check for dependency vulnerabilities:

```bash
flutter pub outdated
flutter pub deps
```

## Compliance

ThothCraft Research is designed with the following compliance standards in mind:

- **GDPR**: European data protection regulations
- **CCPA**: California consumer privacy act
- **COPPA**: Children's online privacy protection
- **HIPAA**: Health information privacy (where applicable)

## Security Features

### Current

- ✅ JWT token-based authentication
- ✅ Secure local storage (KeyStore/Keychain)
- ✅ HTTPS/TLS for all network requests
- ✅ Input validation and sanitization
- ✅ SQL injection prevention (parameterized queries)
- ✅ XSS protection in web views
- ✅ Certificate pinning

### Planned

- 🔄 Biometric authentication (v1.1)
- 🔄 Two-factor authentication (v1.2)
- 🔄 End-to-end encryption for messages (v1.3)
- 🔄 Advanced anomaly detection (v1.4)

## Contact

For security-related questions or concerns:

- **Email**: security@thothcraft.com
- **Bug Reports**: https://github.com/Thothcraft/Research-Portal-app/security/advisories
- **General Support**: support@thothcraft.com

## Acknowledgments

We would like to thank the following security researchers who have helped improve the security of ThothCraft Research:

_(Currently no public acknowledgments)_

---

**Last Updated**: November 10, 2024  
**Version**: 1.0
