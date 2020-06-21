$(function()  {
  let tabs = $(".preference");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".swich").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }
  tabs.click(tabSwitch);    
});

$(function()  {
  let tabs = $(".info-menu-item");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".info-box-content").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }
  tabs.click(tabSwitch);    
});

$(function()  {
  let tabs = $(".mypage-options");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".swich").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }
  tabs.click(tabSwitch);    
});