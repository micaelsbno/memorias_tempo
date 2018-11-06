postMemory = (e) => {
  e.preventDefault()
  let content = e.target.previousElementSibling.value
  navigator.geolocation.getCurrentPosition(
    position => postMemoryByGPS(position, content), 
    (error) => postMemoryByIp(content))
}

appendNewPost = (response) => {
  const posts = document.querySelector('.posts')
  const postDiv = document.createElement('div')
  postDiv.className = 'post'
  postDiv.innerHTML = `
    <p class="post__content">${response.content}</p>
      <div class="post__weather">
          <span class="post__weather--icon"><i class="fas fa-sun"></i></span><p class="post__weather--text">${response.weather_description}</p>
      </div>
      <div class="post__footer">
        <p class="post__footer--time">${formatDate(response.created_at)}</p>
        <p class="post__footer--city">${response.city}</p>
      </div>
    </div>
  `
  posts.insertBefore(postDiv, posts.firstChild)
}

formatDate = (dateString) => {
  date = new Date(dateString)
  string = ``
  string += Math.abs(date.getHours() - 12)
  string += `:${date.getMinutes()}`
  string += `${date.getHours() > 12 ? 'am' : 'pm'}`
  string += ` – ${date.toDateString().split(' ')[0]}, `
  string += `${date.toLocaleDateString()}`
  return string
}

