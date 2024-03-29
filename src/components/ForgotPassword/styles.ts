import { styled } from 'styled-components'
import banner from '../../assets/backgrounds/banner-blur.png'

export const Container = styled.div`
  background-color: ${(props) => props.theme.white};
  z-index: 5;
  width: 30%;
  border-radius: 2.8rem;
  border: 2px solid ${(props) => props.theme['blue-primary']};
  padding: 1rem;
  margin-top: 3.5rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  @media screen and (min-width: 1365px) {
    height: 90%;
  }
  .titleContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-bottom: 1rem;
    border-bottom: 1px solid ${(props) => props.theme['border-gray']};
    h2 {
      font-size: 2.5rem;
      span {
        color: ${(props) => props.theme['blue-primary']};
      }
    }
    p {
      font-size: 1.2rem;
    }
  }
  .emailInput {
    display: block;
    margin-top: 2rem;
    margin-bottom: 0.8rem;
    form {
      display: block;

      input[type='email'] {
        width: 100%;
        outline: none;
        height: 5rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
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
      }
      .caption {
        display: block;
        margin: 0.5rem 0 1rem 0.5rem;
      }
      label {
        font-size: 1.8rem;
        font-weight: bold;
      }
      .buttons {
        padding: 2rem 0 5rem 0;
        display: flex;
        justify-content: center;
        align-items: center;
        button {
          margin-right: 1rem;
          width: 30%;
          height: 4.5rem;
          border-radius: 2rem;
          border: 0;
          background: ${(props) => props.theme['blue-primary']};
          color: white;
          font-size: 1.5rem;
          transition: all 0.2s ease-in-out;
          &:hover {
            filter: brightness(90%);
          }
        }
      }
    }
  }
`

export const BackGroundImage = styled.div`
  width: 100%;
  height: 80vh;
  background-image: url(${banner});
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
`
