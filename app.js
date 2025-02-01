const express = require('express');
const app = express();

const userRoutes =   require('./router/userRoute.js')


const session = require('express-session');
const Sequelize = require('sequelize');
const SequelizeStore = require('connect-session-sequelize')(session.Store);

// Set up Sequelize
const sequelize = require('./database/db.js');


// Set up session store
const sessionStore = new SequelizeStore({
    db: sequelize, // Pass Sequelize instance to the session store
  });
  
  // Set up session middleware
  app.use(session({
    secret: process.env.SESSION_SECRET,  
    resave: false,                         // Don't save session if not modified
    saveUninitialized: false,              // Don't save an uninitialized session
    store: sessionStore,                   // Store sessions in MySQL via Sequelize
    cookie: {
        secure: false,  
        maxAge: 365 * 24 * 60 * 60 * 1000,  
      }          
  }));
  
  // Sync session store with the database
  sessionStore.sync().then(() => {
    console.log('Session store synced with the database.');
  });

const port = 3000;
app.use(express.json())

app.use('/users', userRoutes);




// Set up the server to listen on the port
app.listen(port, 'localhost', () => {
    console.log(`Server is running on http://localhost:${port}`);
});
