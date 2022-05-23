const express = require("express");
const router = express.Router();

const user = require('./services/user')

const app = express();
const port = 3000;

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.set('view engine', 'pug');

router.get("/", async function (req, res, next){
  await user.insert();
  const usersData = await user.getAll();

  res.render('index', { message: 'Full Cycle Rocks!', usersData: usersData })
});

app.use("/", router);

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});