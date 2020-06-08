const mapLoader = () => {
    const mapButton = document.getElementById("map_button");

    mapButton.addEventListener("click", (event) => {
    list_view.classList.add("hidden")
    map_view.classList.remove("hidden")
  });
};

const listLoader = () => {
  const listButton = document.getElementById("list_button");
  console.log(listButton)

  listButton.addEventListener("click", (event) => {
    map_view.classList.add("hidden")
    list_view.classList.remove("hidden")
  });
};

const initPageLoader = () => {
  if (document.getElementById("list_button")) {
    listLoader()
  };
  if (document.getElementById("map_button")) {
    mapLoader()
  };
};

export {initPageLoader};
