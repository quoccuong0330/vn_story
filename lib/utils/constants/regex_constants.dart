const String regexPhoneNumber = r'^\+?[\d-]+$';
const String regexEmail =
    r'^( ){0,}([A-Za-z0-9_=\-+.]){5,32}@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+( ){0,}$';
const String regexUrl =
    r'^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w.-]+)+[\w\-._~:/?#[\]@!$&()*+,;=.]+$';
const String regexPassword = r'^(?=.*[\W_]).{8,}$';
const String urlRegex =
    r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})';
const String extractDataInBraces = r'\[([^)]+)\]';
const String regexSpace = r'\s';
