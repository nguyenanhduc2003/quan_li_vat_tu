document.querySelector('a[href="#lienhe"]').addEventListener('click', function(e) {
    e.preventDefault();
    
    var target = document.getElementById('lienhe');
    var targetPosition = target.offsetTop;
    var startPosition = window.pageYOffset;
    var distance = targetPosition - startPosition;
    var duration = 1000; // Thời gian cuộn từ từ (milisecond)
    var startTime = null;

    // Hàm animate cuộn
    function scrollAnimation(currentTime) {
      if (startTime === null) startTime = currentTime;
      var timeElapsed = currentTime - startTime;
      var run = easeInOutQuad(timeElapsed, startPosition, distance, duration);
      window.scrollTo(0, run);
      
      if (timeElapsed < duration) {
        requestAnimationFrame(scrollAnimation);
      }
    }

    // Hàm ease để cuộn mượt mà
    function easeInOutQuad(t, b, c, d) {
      var p = t / (d / 2);
      if (p < 1) return c / 2 * p * p + b;
      p--;
      return -c / 2 * (p * (p - 2) - 1) + b;
    }

    requestAnimationFrame(scrollAnimation);
  });


  document.querySelector('a[href="#gioithieu"]').addEventListener('click', function(e) {
    e.preventDefault();
    
    var target = document.getElementById('gioithieu');
    var targetPosition = target.offsetTop;
    var startPosition = window.pageYOffset;
    var distance = targetPosition - startPosition;
    var duration = 1000; // Thời gian cuộn từ từ (milisecond)
    var startTime = null;

    // Hàm animate cuộn
    function scrollAnimation(currentTime) {
      if (startTime === null) startTime = currentTime;
      var timeElapsed = currentTime - startTime;
      var run = easeInOutQuad(timeElapsed, startPosition, distance, duration);
      window.scrollTo(0, run);
      
      if (timeElapsed < duration) {
        requestAnimationFrame(scrollAnimation);
      }
    }

    // Hàm ease để cuộn mượt mà
    function easeInOutQuad(t, b, c, d) {
      var p = t / (d / 2);
      if (p < 1) return c / 2 * p * p + b;
      p--;
      return -c / 2 * (p * (p - 2) - 1) + b;
    }

    requestAnimationFrame(scrollAnimation);
  });