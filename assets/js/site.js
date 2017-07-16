function isDarkTheme() {
  if (typeof(Storage) !== "undefined") {
    if (localStorage.getItem("darkTheme") === "true")
      return true;
    else
      return false;
  } else {
    // Your browser is old shit...
    return false;
  }
}

function setDarkTheme(enabled) {
  if (enabled) {
    document.body.className = "dark-theme";
    if (typeof(Storage) !== "undefined") {
      localStorage.setItem("darkTheme", "true");
    }
  } else {
    document.body.className = "";
    if (typeof(Storage) !== "undefined") {
      localStorage.setItem("darkTheme", "false");
    }
  }
}

function updateThemeSwitchText() {
  if (isDarkTheme())
    document.getElementById("theme-switch").innerHTML = "Dark Theme";
  else
    document.getElementById("theme-switch").innerHTML = "Light Theme";
}

function onThemeSwitchClick() {
  setDarkTheme(!isDarkTheme());
  window.location.reload();
}

function refreshTheme() {
  setDarkTheme(isDarkTheme());
}

function formatNumber(number) {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
