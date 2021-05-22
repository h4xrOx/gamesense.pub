a:focus{
    outline: none;
}
.options p{
    margin-top: 8px;
    color: #bababa;
}
.options p b{
    color: #ededed;
}
.b-comment a.hidecomment{
    top:10px;
    right:10px;
    position:absolute;
    color:red;
    font-weight:bold;
}
.admin-sess{
    z-index: 1;
    position: fixed;
    left: 10px;
    bottom: 10px;
    background-color: rgb(6, 6, 6);
    opacity: 0.4;
    padding: 10px;
    text-align: center;
    transition: opacity .25s ease-in-out;
    -moz-transition: opacity .25s ease-in-out;
    -webkit-transition: opacity .25s ease-in-out;
}
.admin-sess:hover{
    opacity: 1;
}
.admin-sess p, .admin-sess a{
    font-family: "Roboto","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: red;
    margin: 0;
}
.b-comment a{
    color: #2a9fd6;
}
p a:hover, .b-comment a:hover, .cmt-name-link:hover{
    text-decoration: underline;
}
li p a.cmt-name-link, .options .cmt-name-link{
    display: inline;
    padding: 0px;
    font-family: "Roboto","Helvetica Neue",Helvetica,Arial,sans-serif;
    border: none;
    color: #2a9fd6;
}
li p a.cmt-name-link:hover, .options .cmt-name-link:hover{
    background-color: rgba(0, 0, 0, 0);
    color: #2a9fd6; 
}
.sidebar ul li .green{
    background: #557c51;
}
.sidebar ul li .green:hover{
    background: #345131;
}
#modal, #modal2{
    display: none;
    position: fixed;
    z-index: 20;
}
.modal-background{
    background-color: rgba(0, 0, 0, 0.4);
    position: fixed;
    width: 100%;
    height: 100vh;
    left: 0;
    top: 0;
}

.modal-container{
    height: 240px;
    width: 450px;
    position: fixed;
    background-color: #383838;
    top: 50%;
    left: 50%;
    margin-top: -180px;
    margin-left: -225px;
    border-radius: 5px;
    color: #cecece;
    padding: 25px 20px;
    font-size: 15px;
    box-shadow: 0 0 30px #0d0e14;
}
.modal-container .confirm{
    position: absolute;
    background-color: green;
    font-size: 15px;
    font-weight: bold;
    padding: 7px 10px;
    bottom: 25px;
}

.modal-container .cancel{
    position: absolute;
    background-color: gray;
    font-size: 15px;
    font-weight: bold;
    padding: 7px 10px;
    bottom: 25px;
}
.modal-container .cancel:hover{
    background-color: #606060;
}
.modal-container .confirm:hover{
    background-color: #006002;
}
.btn{
    line-height: 1.2;
    color: white;
    background: #b21c1c;
    border: 0;
    border-radius: 2px;
    display: inline-block;
    -webkit-font-smoothing: antialiased;
    outline: none;
    padding: 5px 5px 3px 5px;
    vertical-align: top;
    margin-top: 8px;
}
.btn:hover{
    text-decoration: none;
    color: white;
    background: #8c1c1c;
}
.highlight{
    display: inline;
    margin: 0;
    background-color: rgba(255, 255, 0, 0.5);
}
.button.raw.create-reply:hover{
    text-decoration: none;
}
body.bin .admin-options li a{
    background-color: #753b3b;
}
body.bin .admin-options li a:hover{
    background-color: #4d2727;
}
a i.material-icons{
    right: 0;
    top:10px;
    position:absolute;
    font-size: 20px;
    color:#bdbdbd;
}
a i.material-icons:hover{
    color: #a6a6a6;
}
a i.material-icons::selection{
    background:none;
}
a i.material-icons::moz-selection{
    background:none;
}
.sidebar-logo pre{
    text-align: center;
    margin-top: 0;
}
@media screen and (max-width:500px){
    .r-hide{
        display: none;
    }
    body{
        font-size: 10px;
    }
    .sidebar-logo{
        font-size:6px;
    }
    body.bin .button{
        padding: 5px 2px;
    }
}