import { Routes, Route } from 'react-router-dom'
import { Home } from '../pages/Home'
import { DefaultLayout } from '../layouts/DefaultLayout'
import { Register } from '../pages/Register'
import { RegisterPartner } from '../pages/RegisterPartner'
import { Login } from '../pages/Login'
import { Error } from '../pages/Errors'
import { HotelRegister } from '../pages/HotelRegistration'
import { MyHotelsPage } from '../pages/MyHotels'
import { AccountPage } from '../pages/Account'
import { AccountEditPage } from '../pages/AccountEdit'
import { HotelEditPage } from '../pages/HotelEdit'
import { HotelsPage } from '../pages/Hotel'
import { ImageSendForm } from './HotelRegister/ImageForm'

export function Router() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/" element={<DefaultLayout />}>
          <Route path="*" element={<Error />} />
          <Route path="/login" element={<Login />} />
          <Route path="/singup" element={<Register />} />
          <Route path="/singupPartner" element={<RegisterPartner />} />
          <Route path="/users/me" element={<AccountPage />} />
          <Route path="/users/edit/" element={<AccountEditPage />} />
          <Route path="/users/addHotel" element={<HotelRegister />} />
          <Route path="/users/addHotel/:id/image" element={<ImageSendForm />} />
          <Route path="/users/myHotels" element={<MyHotelsPage />} />
          <Route path="/users/myHotels/:id" element={<HotelsPage />} />
          <Route path="/users/myHotels/edit/:id" element={<HotelEditPage />} />
        </Route>
      </Routes>
    </>
  )
}
