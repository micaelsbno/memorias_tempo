// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


postMemory = (e) => {
  e.preventDefault()
  let content = e.target.previousElementSibling.value
  navigator.geolocation.getCurrentPosition((position) => { 
    postMemoryByGPS(position, content) 
  }, postMemoryByIp)
}

appendNewPost = (post) => {
  console.log(post)
}

postMemoryByIp = (res) => { 
  console.log(res)
}