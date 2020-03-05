function displaySearchOptionSpace() {
//    document.getElementById("search_simple").style.height = '40%';
//    document.getElementById("search_simple").style.display = 'none';
//    document.getElementById("search_option").style.display = 'block';
    var heightDiv = document.getElementById("search_space");
    var btnMoreOption = document.getElementById("btn_MoreOption");
    if (heightDiv.style.height === '40%') {
        document.getElementById("search_space").style.height = '80%';
        btnMoreOption.style.background = "url('css/icon_doubleup.png') no-repeat right"; 
    } else {
        document.getElementById("search_space").style.height = '40%';
        btnMoreOption.style.background = "url('css/icon_doubledown.png') no-repeat right";
    }
}