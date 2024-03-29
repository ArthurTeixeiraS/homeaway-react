import { styled } from 'styled-components'
import backgroundImage from '../../../assets/backgrounds/Bg-image.png'

export const HeaderContainer = styled.header`
  min-height: 100vh;
  width: 100%;
  background-image: url(${backgroundImage});
  background-size: cover;
  background-position: center;
  .menu-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 2rem 7%;
  }

  .logo {
    cursor: pointer;
    a {
      display: flex;
      justify-content: center;
      text-decoration: none;
      color: ${(props) => props.theme['blue-primary']};
      span {
        color: ${(props) => props.theme['yellow-secondary']};
      }
      h4 {
        font-size: 3.2rem;
      }
      align-items: center;
    }
  }

  .nav-links {
    li {
      display: inline-block;
      list-style-type: none;
      margin: 1rem 3rem;
      a {
        text-decoration: none;
        color: ${(props) => props.theme.white};
        display: block;
        text-decoration: none;
        position: relative;
        margin-top: 0.8rem;
        font-size: 1.3rem;
        font-weight: bold;

        &::after {
          content: '';
          position: absolute;
          bottom: -0.5rem;
          left: 50%;
          width: 0%;
          height: 0.2rem;
          background-color: ${(props) => props.theme['blue-primary']};
          transition: all 300ms ease-in-out;
        }

        &:hover::after {
          width: 60%;
          left: 20%;
        }
      }
    }
  }
`

export const InitialOptions = styled.div`
  .disabled {
    display: none;
  }
  display: flex;
  justify-items: flex-end;
  width: 27%;
  height: 59px;
  padding: 6px 6px 7px 5px;
  align-items: center;

  .initialCard {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    border-radius: 23px;
    flex-shrink: 0;
    width: 85px;
    background-color: ${(props) => props.theme.white};
    transition: all 0.2s ease-in-out;
    img {
      transition: all 0.2s ease-in-out;
    }
  }

  .initialCard:hover {
    transform: scale(1.03);
    img:hover {
      transform: scale(1.05);
    }
  }

  .dropdown {
    background-color: ${(props) => props.theme.white};
    margin: 0;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;

    .dropdown-content {
      padding: 0.5rem;
      position: absolute;
      background-color: ${(props) => props.theme.white};
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 1;
      border-radius: 1rem;
      left: 80%;
      top: 8.5rem;
      li {
        list-style: none;
        margin: 1.5rem;
        a,
        button {
          text-decoration: none;
          color: ${(props) => props.theme['blue-primary']};
          display: block;
          text-decoration: none;
          position: relative;
          margin-top: 0.8rem;
          font-size: 1.3rem;
          font-weight: bold;
          border: 0;
          background-color: transparent;
          &:hover {
            transform: scale(1.02);
            cursor: pointer;
          }
        }
      }
      .host {
        list-style: none;
        margin: 1.5rem;
        a,
        button {
          text-decoration: none;
          color: ${(props) => props.theme['yellow-secondary']};
          display: block;
          text-decoration: none;
          position: relative;
          margin-top: 0.8rem;
          font-size: 1.3rem;
          font-weight: bold;
          border: 0;
          background-color: transparent;
          &:hover {
            transform: scale(1.02);
            cursor: pointer;
          }
        }
      }
    }
  }
`
export const BecomeHostButton = styled.button`
  width: 186px;
  height: 46px;
  flex-shrink: 0;
  margin: 20px;
  border-radius: 23px;
  background: #484848;
  color: ${(props) => props.theme.white};
  background: ${(props) => props.theme['yellow-secondary']};
  border: 0;
  transition: all 0.2s ease-in-out;
  font-size: 1.5rem;
  font-weight: bold;
  a {
    text-decoration: none;
    color: ${(props) => props.theme.white};
  }

  &:hover {
    filter: brightness(95%);
    transform: scale(1.03);
  }
`

export const SearchContainer = styled.div`
  padding: 15% 25%;
  .headers {
    display: flex;
    justify-content: center;
    background-color: rgba(255, 255, 255, 1);
    border-radius: 2rem 2rem 0 0;
    .title {
      h1 {
        font-size: 4vw;
        font-weight: bold;
        color: ${(props) => props.theme['blue-primary']};
        text-align: center;
        a {
          text-decoration: none;
          color: ${(props) => props.theme['blue-primary']};
        }
      }
    }
    .titleHost {
      h1 {
        font-size: 4vw;
        font-weight: bold;
        color: ${(props) => props.theme['yellow-secondary']};
        text-align: center;
        padding: 1rem;
        span {
          text-decoration: none;
          color: ${(props) => props.theme['blue-primary']};
        }
      }
    }
  }
  .buttonForStart {
    display: flex;
    justify-content: center;
    a {
      button {
        width: 30rem;
      }
    }
  }
  .search-box {
    background-color: ${(props) => props.theme.white};
    width: 100%;
    margin: 1%.5 auto;
    padding: 0.6rem 1rem 0.6rem 3rem;
    border-radius: 0 0 2rem 2rem;
    font-size: 1.5rem;
    form {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;

      input {
        display: block;
        border: 0;
        outline: none;
        background-color: transparent;
      }

      button {
        background-color: ${(props) => props.theme['yellow-secondary']};
        width: 5.5rem;
        height: 5.5rem;
        border-radius: 50%;
        border: 0;
        outline: none;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
      }
    }
  }
`
