const app = require("express")();

app.get("/", (req, res) => {
  res.send("Hello Docker, we meet again");
});

const port = process.env.PORT || 8080;

app.listen(port, () => console.log("app listening on port " + port));
