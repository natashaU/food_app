const express = require('express');
const path = require('path');
const methodOverride = require('method-override');
const bodyParser = require('body-parser');
const logger = require('morgan');

const itemsRouter = require('./routes/items');

const PORT = process.env.PORT || 3000;

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(bodyParser.urlencoded({
  extended: false,
}));
app.use(bodyParser.json());

app.use(methodOverride('_method'));

app.use('/items', itemsRouter);

// use this??
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.render('index');
});

app.get('/about', (req, res) => {
  res.render('about');
});

app.listen(PORT, () => {
  console.log(`Server up and listening on port ${PORT}, in ${app.get('env')} mode.`);
});
