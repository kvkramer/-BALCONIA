map_button = document.getElementById("map_view");
list_button = document.getElementById("list_view");
// tab1 = document.getElementById("tab1");
// tab2 = document.getElementById("tab2");


map_button.addEventListener("click", (event) => {
  map_view.classList.add("hidden")
  list_view.classList.remove("hidden")
});

list_button.addEventListener("click", (event) => {
  list_view.classList.add("hidden")
  map_view.classList.remove("hidden")
});
