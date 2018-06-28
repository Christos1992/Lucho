function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 50) {
        navbar.classList.add('navbar-wagon-white');
      } else {
        console.log("not working")
        navbar.classList.remove('navbar-wagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
