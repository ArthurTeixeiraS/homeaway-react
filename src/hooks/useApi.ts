import axios from 'axios'

const api = axios.create({
  baseURL: 'https://02b9-177-200-4-83.ngrok-free.app/api',
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

  findRooms: async (
    city: string,
    checkin: string,
    checkout: string,
    maxPeople: number,
  ) => {
    const response = await api.get(
      `/rooms/city/${city}/check-in/${checkin}/check-out/${checkout}/max-people/${maxPeople}`,
      {
        headers: {
          'ngrok-skip-browser-warning': 'true',
        },
      },
    )
    return response
  },

  forgotPassword: async (email: string) => {
    const response = await api.post(`/passwords/send-reset-email`, {
      email,
    })
    return response.data
  },

  sendPasswordCode: async (
    code: string,
    newPassword: string,
    reapeatNewPassword: string,
  ) => {
    const response = await axios.post(`/passwords/forgot-password-reset`, {
      code,
      newPassword,
      reapeatNewPassword,
    })
    return response.data
  },
})
