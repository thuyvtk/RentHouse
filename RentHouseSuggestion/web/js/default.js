function displaySearchOptionSpace() {
//    document.getElementById("search_simple").style.height = '40%';
//    document.getElementById("search_simple").style.display = 'none';
//    document.getElementById("search_option").style.display = 'block';
    var heightDiv = document.getElementById("search_simple");
    if (heightDiv.style.height === '40%') {
        document.getElementById("search_simple").style.height = '80%';
    } else {
        document.getElementById("search_simple").style.height = '40%';
    }
}