import styled from 'styled-components'
import banner from '../../assets/backgrounds/banner-blur.png'

export const LoginContainer = styled.div`
  background-color: ${(props) => props.theme.white};
  width: 40%;
  height: 70%;
  z-index: 5;
  border-radius: 2.8rem;
  padding: 3rem;
  margin: 0 auto !important;
  display: block;
  justify-content: center;
  align-items: center;
  .titleContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding-bottom: 1rem;
    border-bottom: 1px solid ${(props) => props.theme['border-gray']};
    h2 {
      font-size: 2.5rem;
    }
    p {
      font-size: 1.2rem;
    }
  }
  .loginInput {
    display: flex;
    justify-content: center;
    margin-top: 2rem;
    margin-bottom: 0.8rem;
    width: 100%;
    form {
      display: block;
      align-items: start;
      justify-content: center;

      label {
        font-size: 1.8rem;
        font-weight: bold;
        padding: 1.5rem 0;
      }

      input[type='text'],
      input[type='password'] {
        width: 100%;
        outline: none;
        height: 5rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
        margin-top: 1rem;
      }
      p {
        margin: 1rem;
      }
      a {
        text-decoration: none;
        font-size: 1.2rem;
        color: ${(props) => props.theme['blue-primary']};
      }
      .buttons {
        padding: 2rem 0 5rem 0;
        display: flex;
        justify-content: center;
        align-items: center;
        .continue {
          margin-right: 1rem;
          width: 30%;
          height: 4.5rem;
          border-radius: 2rem;
          border: 0;
          background: ${(props) => props.theme['blue-primary']};
          color: white;
          font-size: 1.5rem;
        }
      }
    }
  }
`
export const BackGroundImage = styled.div`
  width: 100%;
  height: 99vh;
  background-image: url(${banner});
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
`
