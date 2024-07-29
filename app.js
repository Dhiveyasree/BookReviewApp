const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const app = express();

// Create MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'c237_supermarketapp1'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');

// Enable static files
app.use(express.static('Public'));

// Enable form processing
app.use(express.urlencoded({ extended: false }));

// Set up Multer for file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'Public/imagesbooks'); // Directory to save uploaded files
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname); // Save file with its original name
  }
});
const upload = multer({ storage: storage });

// Routes
// [R] Display ALL books
app.get('/', (req, res) => {
  const sql = "SELECT * FROM books";
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send("Error retrieving books");
    }
    res.render('index', { books: results });
  });
});

// [R] Display reviews of a specific book
app.get('/book/:id/reviews/', function(req, res) {
    const bookId = req.params.id;
    
    // Query to retrieve reviews for the specified book
    const sql = "SELECT * FROM reviews WHERE bookId = ?";
    
    connection.query(sql, [bookId], function (err, reviews) {
      if (err) {
        console.error('Error retrieving reviews:', err);
        return res.status(500).send("Error retrieving reviews for book");
      }
      
      // Render the view with the reviews data
      res.render('reviews', { reviews: reviews });
    });
  });
  
// [R] Display ONE book
app.get('/book/:id', (req, res) => {
    const bookId = req.params.id;
    const sql = "SELECT * FROM books WHERE bookId = ?";
    connection.query(sql, [bookId], (error, results) => {
      if (error) {
        console.error("Database query error:", error.message);
        return res.status(500).send("Error retrieving book by ID");
      }
      if (results.length > 0) {
        res.render('book', { book: results[0] });
      } else {
        res.status(404).send("Book Not Found");
      }
    });
  });
  

// [C] Add book - display form
app.get('/addBook', (req, res) => {
  res.render('addBook');
});

// [C] Add book - save data with image upload
app.post('/addBook', upload.single('image'), (req, res) => {
  const { bookTitle, author, genre, publishedDate } = req.body;
  const image = req.file ? req.file.filename : null;
  const sql = "INSERT INTO books (bookTitle, author, genre, publishedDate, image) VALUES (?, ?, ?, ?, ?)";
  connection.query(sql, [bookTitle, author, genre, publishedDate, image], (error, results) => {
    if (error) {
      console.error("Error adding book:", error);
      return res.status(500).send("Error adding book");
    }
    res.redirect("/");
  });
});


// [U] Update Book - Retrieve data for update form
app.get('/updateBook/:id', (req, res) => {
    const bookId = req.params.id;
    const sql = "SELECT * FROM books WHERE bookId = ?";
    connection.query(sql, [bookId], (error, results) => {
      if (error) {
        console.error('Database query error:', error.message);
        return res.status(500).send("Error retrieving book by ID");
      }
      if (results.length > 0) {
        res.render('updateBook', { book: results[0] });
      } else {
        res.status(404).send("Book Not Found");
      }
    });
  });
  

// [U] Update book - save updated data with image upload
app.post('/updateBook/:id', upload.single('image'), (req, res) => {
  const bookId = req.params.id;
  const { bookTitle, author, genre, publishedDate} = req.body;
  let image = req.body.currentImage;
  if (req.file) {
    image = req.file.filename;
  }
  const sql = "UPDATE books SET bookTitle = ?, author = ?, genre = ?, publishedDate = ?, image = ? WHERE bookId = ?";
  connection.query(sql, [bookTitle, author, genre, publishedDate, image, bookId], (error, results) => {
    if (error) {
      console.error("Error updating book:", error);
      return res.status(500).send("Error updating book");
    }
    res.redirect("/");
  });
});

// [D] Delete book
app.get('/deleteBook/:id', (req, res) => {
  const bookId = req.params.id;
  const sql = "DELETE FROM books WHERE bookId = ?";
  connection.query(sql, [bookId], (error, results) => {
    if (error) {
      console.error("Error deleting book:", error);
      return res.status(500).send("Error deleting book");
    }
    res.redirect("/");
  });
});


  // [C] Add a review - display form
  app.get('/book/:id/addReview', (req, res) => {
    const bookId = req.params.id;
    res.render('addReview', { bookId });
  });
  
// [C] Add a review - save form to database
app.post('/book/:id/addReview', (req, res) => {
    const bookId = req.params.id;
    const {reviewerName, reviewText, lastEdited } = req.body;
    const sql = "INSERT INTO reviews ( bookId, reviewerName, reviewText, lastEdited) VALUES (?, ?, ?, ?)";
    const values = [bookId, reviewerName, reviewText, lastEdited];

    connection.query(sql, values, (error, results) => {
        if (error) {
            console.error("Error adding review:", error);
            return res.status(500).send("Error adding review");
        }
        console.log("Review added successfully!");
        res.redirect(`/book/${bookId}`); // Redirect to book details page after adding review
    });
});

  // [U] Update Review - Retrieve data for update form
app.get('/updateReview/:reviewId', (req, res) => {
    const reviewId = req.params.reviewId;
    const sql = "SELECT * FROM reviews WHERE reviewId = ?";
    connection.query(sql, [reviewId], (error, results) => {
      if (error) {
        console.error('Database query error:', error.message);
        return res.status(500).send("Error retrieving review by ID");
      }
      if (results.length > 0) {
        res.render('updateReview', { review: results[0] });
      } else {
        res.status(404).send("Review Not Found");
      }
    });
  });
  

// [U] Update review - save updated data
app.post('/updateReview/:reviewId', (req, res) => {
  const reviewId = req.params.reviewId;
  const { reviewerName, reviewText, lastEdited } = req.body;
  
  const sql = "UPDATE reviews SET reviewerName = ?, reviewText = ?, lastEdited = ? WHERE reviewId = ?";
  connection.query(sql, [reviewerName, reviewText, lastEdited, reviewId], (error, results) => {
    if (error) {
      console.error("Error updating review:", error);
      return res.status(500).send("Error updating review");
    }
    res.redirect("/");
  });
});

  
  // [D] Delete review
  app.get('/deleteReview/:reviewId', (req, res) => {
    const reviewId = req.params.reviewId;
    const sql = "DELETE FROM reviews WHERE reviewId = ?";
    connection.query(sql, [reviewId], (err) => {
        if (err) {
            console.error('Error deleting review:', err);
            return res.status(500).send("Error deleting review");
        }
        res.redirect('back'); // Redirect to the previous page
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));

// Surendirakumar Dhiveyasree 23025757