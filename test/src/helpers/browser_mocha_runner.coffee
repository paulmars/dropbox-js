runTests = ->
  runner = null
  runner = mocha.run ->
    return if runner is null  # Synchronous tests may call this spuriously.
    failures = runner.failures || 0
    total = runner.total || 0
    image = new Image()
    image.src = "/diediedie?failed=#{failures}&total=#{total}";
    image.onload = ->
      null

if window.cordova
  document.addEventListener 'deviceready', runTests
else
  window.addEventListener 'load', runTests
