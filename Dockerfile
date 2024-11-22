# בחר את התמונה של Node.js שאתה צריך
FROM node:lts

# הגדר את ספריית העבודה ב-Docker
WORKDIR /app

# העתק את קובץ ה-package.json וה-package-lock.json
COPY package*.json ./

# התקן את כל התלויות
RUN npm install

# העתק את יתר קבצי הפרויקט
COPY . .

# בנה את האפליקציה (לשלב פרודקשן)
RUN npm run build

# חשוף את הפורט שבו האפליקציה רצה
EXPOSE 3000

# הפעל את השרת (הפקודה שתפעיל את האפליקציה שלך)
CMD ["npm", "start"]
