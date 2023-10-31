import { styled } from 'styled-components'

export const HeaderContainer = styled.header`
  display: inline-flex;
  padding: 7px 74px 4px 76px;
  width: 100%;
  justify-content: space-between;
  align-items: center;
  gap: 5px;
  background-color: ${(props) => props.theme.gray};

  .logo {
    width: 33.3%;
  }

  .logoName {
    text-decoration: none;
    color: ${(props) => props.theme['blue-primary']};
  }

  .logoName span {
    color: ${(props) => props.theme['yellow-secondary']};
  }

  h1 {
    font-size: 30px;
    a {
      display: flex;
      align-items: center;
    }
  }
  .middleOptions {
    width: 33.3%;
    nav {
      ul {
        display: flex;
        li {
          list-style: none;
          padding: 10px;
        }
      }
    }
  }
`

export const InitialOptions = styled.div`
  display: flex;
  justify-items: flex-end;
  width: 33.3%;
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

  &:hover {
    filter: brightness(95%);
    transform: scale(1.03);
  }
`
