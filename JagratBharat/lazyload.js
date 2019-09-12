const imgs = document.querySelectorAll("[data-src]");

function preloadImage(img) {
    const src = img.getAttribute("data-src");
    if (!src) {
        return;
    }
    let newImage = document.createElement("img");

    newImage.src = src;
    newImage.onload = function () {
        img.src = newImage.src;

    };



}


const imageOptions = {};


const imageObserver = new IntersectionObserver((enries, imageObserver) => {

    enries.forEach(entry => {
        if (!entry.isIntersecting) {
            return;
        } else {
            preloadImage(entry.target);
            imageObserver.unobserve(entry.target);
        }
    });

}, imageOptions);

imgs.forEach(img => {
    imageObserver.observe(img);
});