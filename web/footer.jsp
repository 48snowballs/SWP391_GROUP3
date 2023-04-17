<%-- 
    Document   : footer
    Created on : Jun 27, 2022, 12:09:26 AM
    Author     : vuman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- JQuery -->
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"
></script>

<!-- MDB -->
<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"
></script>

<!-- Owl Carousel -->
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Custom JS -->
<script>
    $(document).ready(function () {
        const owlCarousel = $(".owl-carousel");
        owlCarousel.owlCarousel({
            nav: false,
            dots: false,
            slideBy: 1,
            margin: 10,
            loop: true,
            autoplay: true,
            autoplayTimeout: 4500,
            smartSpeed: 550,
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 1,
                },
                1000: {
                    items: 1,
                },
            },
        });

        $("#owl-carousel__left").click(function () {
            owlCarousel.trigger("prev.owl.carousel");
        });

        $("#owl-carousel__right").click(function () {
            owlCarousel.trigger("next.owl.carousel");
        });
    });
</script>

<script>
    $(document).ready(function () {
        const offsetTop = $(
                ".eightshoes-header__bottom-nav-bar",
                ).offset().top;

        $(document).scroll(function () {
            if ($(document).scrollTop() > offsetTop) {
                $(".eightshoes-header__bottom-nav-bar").addClass(
                        "fixed-top",
                        );
            } else {
                $(".eightshoes-header__bottom-nav-bar").removeClass(
                        "fixed-top",
                        );
            }
        });
    });
</script>