$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".prf");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".swich").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});

$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".info-menu-item");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".info-box-content").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});

$(function () {
  function eventCalendar() {
      return $('#calendar').fullCalendar({});
  };
  function clearCalendar() {
      $('#calendar').html('');
  };
  $(document).on('turbolinks:load', function () {
  eventCalendar();
  });
  $(document).on('turbolinks:before-cache', clearCalendar);

  $('#calendar').fullCalendar({
  events: '/events.json'
  });
});





$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".mypage-options");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".swich").removeClass("show").eq(index).addClass("show");
    console.log("hello")
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});