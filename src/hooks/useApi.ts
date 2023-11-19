import axios from 'axios'

const api = axios.create({
  baseURL: 'https://629b-177-200-4-83.ngrok-free.app/api',
})

export const UseAPI = () => ({
  validateToken: async (token: string) => {
    const response = await api.get('/users/me', {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
    /*     console.log(response.data) */
    return response.data
  },

  singin: async (email: string, password: string) => {
    const response = await api.post('/login', {
      email,
      password,
    })
    console.log(response.data)
    return response.data
  },

  /* logout: async () => {
    const response = await api.post('/logout')
    return response.data
  }, */
})
