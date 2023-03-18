// test env
console.log(process.env.SECRET_OF_LIFE);
console.log(process.env.HELLO);

const app = require("express")();

app.get("/", (req, res) => {
  res.send("Hello Docker, we meet again");
});

const port = process.env.PORT || 8080;

app.listen(port, () => console.log("app listening on port " + port));
