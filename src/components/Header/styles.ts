import { styled } from 'styled-components'

export const HeaderContainer = styled.header`
  display: inline-flex;
  padding: 7px 0.5px 4px 30px;
  width: 100%;
  justify-content: space-around;
  align-items: center;
  gap: 5px;
  background-color: transparent;
  z-index: 10;
  border-bottom: 1px solid ${(props) => props.theme['container-colors']};

  .logo {
    width: 31.3%;
  }

  .logoName {
    text-decoration: none;
    color: ${(props) => props.theme['blue-primary']};
  }

  .logoName span {
    color: ${(props) => props.theme['yellow-secondary']};
  }

  h1 {
    font-size: 3.2rem;
    a {
      display: flex;
      align-items: center;
      width: 50%;
    }
  }
  .middleOptions {
    li {
      display: inline-block;
      list-style-type: none;
      margin: 1rem 3rem;
      a {
        text-decoration: none;
        color: ${(props) => props.theme.black};
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
          width: 80%;
          left: 10%;
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
      position: fixed;
      background-color: ${(props) => props.theme.white};
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 2;
      border-radius: 1rem;
      left: 82%;
      top: 8.5rem;
      li {
        list-style: none;
        margin: 1.5rem;
        a {
          text-decoration: none;
          color: ${(props) => props.theme['blue-primary']};
          display: block;
          text-decoration: none;
          position: relative;
          margin-top: 0.8rem;
          font-size: 1.3rem;
          font-weight: bold;
          &:hover {
            transform: scale(1.02);
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
export const MenuSpacing = styled.div`
  height: 90px;
`
