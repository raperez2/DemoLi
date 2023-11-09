const express = require('express')
const app = express()

var jsonObj = {
    "message": "My name is Ray Perez",
    "timestamp": Date().now()/1000,
}

app.listen(process.env.PORT || 80, () => {
    console.log(`Server running ...`)
})

app.get("/*",(req,res)=>{
    console.log(jsonObj)
    jsonObj.timestamp= Date().now()/1000;
    res.send(jsonObj)
})