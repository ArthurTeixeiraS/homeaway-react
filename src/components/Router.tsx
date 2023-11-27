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
import { RoomRegister } from '../pages/Room/RoomRegister'
import { RoomImageSendForm } from './Room/RoomRegister/ImageForm'
import { RequireAuth } from '../contexts/Auth/RequireAuth'
import { FindPlaces } from './FindPlaces'
import { ImageEditForm } from './HotelEdit/ImageForm'
import { RoomEditPage } from '../pages/Room/RoomEdit'
import { RoomImageEditForm } from './Room/RoomEdit/ImageForm'
import { ForgotPasswordPage } from '../pages/ForgotPassword'
import { RoomPage } from '../pages/Room/RoomPage'
import { ReservationPage } from '../pages/Reservation'
import { ReservationPageTenant } from '../pages/Reservation/Tenant'

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
          <Route path="/forgotPassword" element={<ForgotPasswordPage />} />
          <Route path="/findPlaces" element={<FindPlaces />} />
          <Route
            path="/users/me"
            element={
              <RequireAuth>
                <AccountPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/edit/"
            element={
              <RequireAuth>
                <AccountEditPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/host/reservations/:id"
            element={
              <RequireAuth>
                <ReservationPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/client/reservations/"
            element={
              <RequireAuth>
                <ReservationPageTenant />
              </RequireAuth>
            }
          />
          <Route
            path="/users/addHotel"
            element={
              <RequireAuth>
                <HotelRegister />
              </RequireAuth>
            }
          />
          <Route
            path="/users/addHotel/:id/image"
            element={
              <RequireAuth>
                <ImageSendForm />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels"
            element={
              <RequireAuth>
                <MyHotelsPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/:id"
            element={
              <RequireAuth>
                <HotelsPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/edit/:id"
            element={
              <RequireAuth>
                <HotelEditPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/edit/:id/image"
            element={
              <RequireAuth>
                <ImageEditForm />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/room/addRoom/:id"
            element={
              <RequireAuth>
                <RoomRegister />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/room/addRoom/:id/image"
            element={
              <RequireAuth>
                <RoomImageSendForm />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/room/edit/:id"
            element={
              <RequireAuth>
                <RoomEditPage />
              </RequireAuth>
            }
          />
          <Route
            path="/users/myHotels/room/edit/:id/image"
            element={
              <RequireAuth>
                <RoomImageEditForm />
              </RequireAuth>
            }
          />
          <Route
            path="/room/:id/:checkin/:checkout/:maxPeople"
            element={
              <RequireAuth>
                <RoomPage />
              </RequireAuth>
            }
          />
        </Route>
      </Routes>
    </>
  )
}
