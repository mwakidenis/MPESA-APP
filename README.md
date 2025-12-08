# 💸 M-Pesa STK Push Flutter App — Powered by Daraja API

This project is a **modern mobile payment application** that integrates **Safaricom’s M-Pesa Daraja API** with a **Flutter frontend** and a **Node.js + Express backend**.

It allows users to initiate **STK Push payments** directly from the Flutter app, enabling real-time mobile transactions between customers and businesses in Kenya.

---

## 🧠 Project Overview

The app demonstrates **how to connect a mobile frontend to the official M-Pesa payment gateway** using the **Daraja API**, making it an ideal foundation for:
- Fintech startups 💰  
- E-commerce mobile apps 🛒  
- Billing and subscription systems 📱  
- School or event payment apps 🎓  

It supports token generation, API authorization, and secure payment initiation using **STK Push**.

---

## 🌟 Features

✅ **1. Secure Token Generation**
- Uses M-Pesa’s OAuth 2.0 to request an access token securely via Node.js.

✅ **2. STK Push Integration**
- Initiates payment directly to a user’s mobile number from the app.

✅ **3. Flutter Frontend**
- Simple, clean, and responsive design built using Flutter.
- Includes a one-tap “Pay with M-Pesa” button.

✅ **4. Node.js Backend (Express Server)**
- Handles all API communication with Safaricom Daraja.
- Keeps secret keys and access tokens hidden from the Flutter app.

✅ **5. CORS Support**
- Allows the Flutter frontend to communicate seamlessly with the backend during local development.

✅ **6. Easy Migration**
- Designed to switch from **sandbox (test)** to **production** by simply replacing credentials.

✅ **7. Modular Codebase**
- Backend and frontend separated for easy updates and scaling.

---

## 🧰 Tools & Technologies Used

| Tool / Framework | Purpose |
|------------------|----------|
| **Flutter** | Frontend mobile UI |
| **Dart** | Flutter programming language |
| **Node.js** | Backend runtime for API server |
| **Express.js** | Framework to build RESTful APIs |
| **Axios** | HTTP client to communicate with Daraja API |
| **Body-Parser** | Parse incoming API requests |
| **CORS** | Enables frontend-backend communication |
| **Safaricom Daraja API** | M-Pesa payment gateway |
| **Postman / cURL** | API testing tools |

---

## 🧩 Project Structure

m_pesa_app/
│
├── lib/
│ ├── main.dart # Main entry point of the Flutter app
│ ├── screens/
│ │ └── home_screen.dart # Home page UI
│ ├── widgets/
│ │ └── payment_button.dart # Reusable button widget
│ └── services/
│ └── mpesa_service.dart # Handles API calls to backend
│
├── mpesa_backend/
│ ├── server.js # Node.js server for MPESA API
│ ├── package.json # Backend dependencies and scripts
│ └── node_modules/ # Auto-generated Node packages
│
├── android/ # Android-specific Flutter files
├── ios/ # iOS-specific Flutter files
├── pubspec.yaml # Flutter dependencies and assets
└── README.md # Project documentation

# 👨‍💻 Author
- **✨Mwaki Denis✨**
- **📍 Meru University of Science and Technology, Kenya 🇰🇪**
- **💼 Developer | Innovator | Future Technologist | Software engineer**
- **🌐 Passionate about tech that changes lives and builds a better world.**
- **🌐Continuous learning & innovation.**

**If you found this helpful you can** [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%F0%9F%8D%B5-yellow?style=for-the-badge)](https://wa.me/254798750585)
**Give it a ✨!**

<div align="center">

### 🌟 **Thanks for Visiting!** 🌟
