map_button = document.getElementById("map_button");
list_button = document.getElementById("list_button");
// tab1 = document.getElementById("tab1");
// tab2 = document.getElementById("tab2");


list_button.addEventListener("click", (event) => {
  map_view.classList.add("hidden")
  list_view.classList.remove("hidden")
});

map_button.addEventListener("click", (event) => {
  list_view.classList.add("hidden")
  map_view.classList.remove("hidden")
});
