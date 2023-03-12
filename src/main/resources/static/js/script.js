const slider = document.querySelector(".slider");
const slider1 = document.querySelector(".slider one");
const btnLeft = document.getElementById("moveLeft");
const btnRight = document.getElementById("moveRight");
const indicators = document.querySelectorAll(".indicator");


let baseSliderWidth = slider.offsetWidth;
//오프셋위쓰 =  엘리먼트 전체 크기를 알고싶을때, 엘리먼트의 패딩과 보더
//스크롤바의 사이즈를 포함한 값을 리턴함
let activeIndex = 0; // 슬라이더의 현재 페이지

let movies = [
  {
    src:
      "./img/1917.jpg",
  },
  
  {
    src:
      "./img/moonknight.jpg",
  },

  {
    src:
      "./img/justiceleague.jpg",
  },

	{
    src:
      "./img/6underground.jpg",
  },
  {
    src:
      "./img/doctor.jpg",
  },
  {
    src:
      "./img/falcon.jpg",
  },
  {
    src:
      "./img/6underground.jpg",
  },
  {
    src:
      "./img/doctor.jpg",
  },
  {
    src:
      "./img/falcon.jpg",
  },
  
];

// Fill the slider with all the movies in the "movies" array
//슬라이더의 "동영상" 배열의 모든 동영상 채우기
function populateSlider() {
//슬라이더 채운다는 펑션

  movies.forEach((image) => {
	//foreach 는 배열요소를 끝까지 반복함, => 이건 애로우함수
    // Clone the initial movie thats included in the html, then replace the image with a different one
    //// html에 포함된 초기 동영상을 복제한 다음 이미지를 다른 동영상으로 바꾸기
    const newMovie = document.getElementById("movie0");
    let clone = newMovie.cloneNode(true);
    
    //클론노드 = 말 그대로 노드를 클론함
    let img = clone.querySelector("img"); //처음 접근하는 쿼리에 복제
    img.src = image.src;

    slider.insertBefore(clone, slider.childNodes[slider.childNodes.length - 1]);
  });//기존 부모노드를 삭제하지 않고 복제해서 넣는 약간 그런느낌인듯 함
}

populateSlider();
populateSlider();

// delete the initial movie in the html
//html에서 초기 동영상 삭제
const initialMovie = document.getElementById("movie0");
initialMovie.remove();



// Update the indicators that show which page we're currently on
//현제 페이지를 표시하는 표시기 업데이트
function updateIndicators(index) {
  indicators.forEach((indicator) => {
    indicator.classList.remove("active");
  });
  let newActiveIndicator = indicators[index];
  newActiveIndicator.classList.add("active");
}

// 왼쪽 스크롤 버튼
btnLeft.addEventListener("click", (e) => {
  let movieWidth = document.querySelector(".movie").getBoundingClientRect()
    .width;
  let scrollDistance = movieWidth * 6;
   // 스크롤 되는 영상물의 길이. //모바일은 4개 하라는거같음 make work for mobile because (4 movies/page instead of 6)

  slider.scrollBy({
    top: 0,
    left: -scrollDistance,
    behavior: "smooth",
  });
  activeIndex = (activeIndex - 1) % 3;
  console.log(activeIndex);
  updateIndicators(activeIndex);
});

// 오른쪽 스크롤 버튼
btnRight.addEventListener("click", (e) => {
  let movieWidth = document.querySelector(".movie").getBoundingClientRect()
    .width;
  let scrollDistance = movieWidth * 6; // Scroll the length of 6 movies. TODO: make work for mobile because (4 movies/page instead of 6)

  console.log(`movieWidth = ${movieWidth}`);
  console.log(`scrolling right ${scrollDistance}`);

  //마지막 페이지 도달시
  if (activeIndex == 2) {
    // 슬라이더의 모든 항목을 복제함(나중에 지워야함))
    populateSlider();
    slider.scrollBy({
      top: 0,
      left: +scrollDistance,
      behavior: "smooth",
    });
    activeIndex = 0;
    updateIndicators(activeIndex);
  } else {
    slider.scrollBy({
      top: 0,
      left: +scrollDistance,
      behavior: "smooth",
    });
    activeIndex = (activeIndex + 1) % 3;
    console.log(activeIndex);
    updateIndicators(activeIndex);
  }
});

// slider.addEventListener("scroll", (e) => {
//   console.log(slider.scrollLeft);
//   console.log(slider.offsetWidth);
// });
