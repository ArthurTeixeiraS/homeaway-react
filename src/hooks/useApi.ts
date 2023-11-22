import axios from 'axios'

const api = axios.create({
  baseURL: 'http://localhost:8080/api',
})

export const UseAPI = () => ({
  validateToken: async (token: string) => {
    const response = await api.get('/users/me', {
      headers: {
        Authorization: `Bearer ${token}`,
        'ngrok-skip-browser-warning': 'true',
      },
    })
    return response.data
  },

  singin: async (email: string, password: string) => {
    const response = await api.post('/login', {
      email,
      password,
    })
    return response.data
  },

  findHotels: async (token: string) => {
    const response = await api.get('/hotels/me', {
      headers: {
        Authorization: `Bearer ${token}`,
        'ngrok-skip-browser-warning': 'true',
        'Content-Type': 'multipart/form-data',
      },
    })
    return response.data
  },
})
