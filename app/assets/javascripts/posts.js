postMemory = (e) => {
  e.preventDefault()
  let content = e.target.previousElementSibling.value
  navigator.geolocation.getCurrentPosition((position) => { 
    postMemoryByGPS(position, content) 
  }, postMemoryByIp)
}

appendNewPost = (response) => {
  const posts = document.querySelector('.posts')
  const postDiv = document.createElement('div')
  postDiv.textContent = response.content
  posts.insertBefore(postDiv, posts.firstChild)
}

