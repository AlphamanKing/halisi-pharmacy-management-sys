<html>
<head>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <title>Terms of Service</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        h1 {
            text-align: center;
            color: #0078d4;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        p {
            line-height: 1.5;
        }

        ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0078d4;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right:70px;
        }

        .button:hover {
            background-color: #005a9e;
        }
    </style>
    <script>
        function agree() {
            window.location.href = "../Dashboards/Pharmacist_dashboard/index.php"; 
        }

        function disagree() {
            var confirm = window.confirm("Are you sure you want to disagree with the terms of service?");
            if (confirm) {
                window.alert("We are sorry to see you go. The web app will now close.");
                window.close();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Halisi Pharmacy Management System</h1>
        <p>Welcome to our Pharmacy Management System (PMS), a web-based application that helps you manage your pharmacy business. By using PMS, you agree to the following terms of service:</p>
        <ul>
            <li>You are responsible for maintaining the security and confidentiality of your account and password. You are also responsible for all activities that occur under your account.</li>
            <li>You agree to use PMS only for lawful purposes and in accordance with these terms of service. You agree not to use PMS for any illegal, fraudulent, harmful, or unauthorized activities.</li>
            <li>You agree to comply with all applicable laws and regulations when using PMS, including but not limited to those related to data protection, privacy, intellectual property, and health care.</li>
            <li>You agree to respect the rights and interests of other users and third parties when using PMS. You agree not to interfere with, disrupt, or damage PMS or its servers, networks, or data.</li>
            <li>You agree to provide accurate, complete, and current information when using PMS. You agree not to provide false, misleading, or outdated information.</li>
            <li>You agree to pay any fees or charges that may apply to your use of PMS, as specified in the pricing plan you choose. You agree to keep your payment information updated and valid.</li>
            <li>You agree to accept any updates or changes to PMS that we may make from time to time. We reserve the right to modify, suspend, or terminate PMS or any part of it at any time, with or without notice.</li>
            <li>You agree to indentify, defend, and hold harmless PMS and its affiliates, partners, licensors, and suppliers from any claims, damages, liabilities, costs, or expenses arising from or relating to your use of PMS or your breach of these terms of service.</li>
            <li>You agree that PMS is provided "as is" and "as available", without any warranties or guarantees of any kind, express or implied. We disclaim any liability for any loss or damage arising from or relating to your use of PMS or your reliance on any information or content provided by PMS.</li>
            <li>You agree that these terms of service constitute the entire agreement between you and PMS regarding your use of PMS. These terms of service are governed by the laws of Kenya, and any disputes arising from or relating to these terms of service will be subject to the exclusive jurisdiction of the courts of Kenya.</li>
        </ul>
        <p>If you have any questions or feedback about PMS or these terms of service, please contact us at support@pms.com.</p>
        <p>Thank you for choosing PMS!</p>
        <p><a href="#" class="button" onclick="agree()" >I Agree</a><a href="#" class="button" onclick="disagree()">I Disagree</a></p>
    </div>
</body>
</html>
