<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  </style>



		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
			
			
				<div class="swiper-slide">
					<div class="swiper-zoom-container">
						<img onclick="window.location.href='${plurl[0].platform_url}'"
							src="https://t1.daumcdn.net/brunch/service/user/10ca/image/CLhLYV68hoY1j_dc2qkvcVq_7p0.PNG" />
					</div>
				</div>
				
				
				
				<div class="swiper-slide">
					<div class="swiper-zoom-container">
						<img onclick="window.location.href='${plurl[1].platform_url}'"
							src="https://wiizmkrstorage.blob.core.windows.net/content/wi_user_132718529217651057_25053288-d837-4031-9ca3-5b209f6bee75.jpeg" />
					</div>
				</div>
				<div class="swiper-slide">
					<div class="swiper-zoom-container">
						<img onclick="window.location.href='${plurl[2].platform_url}'"
							src="https://t1.kakaocdn.net/thumb/R1920x0.fwebp.q100/?fname=https%3A%2F%2Ft1.kakaocdn.net%2Fkakaocorp%2Fkakaocorp%2Fadmin%2Fservice%2Fad52cc82017900001.jpg" />
					</div>
				</div>

			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>


		<!-- Swiper JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 10000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>