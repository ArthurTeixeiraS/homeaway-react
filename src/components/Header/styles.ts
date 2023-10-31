import { styled } from 'styled-components'

export const HeaderContainer = styled.header`
  display: inline-flex;
  padding: 7px 0.5px 4px 30px;
  width: 100%;
  justify-content: space-around;
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
    display: flex;
    justify-content: space-between;
    padding-top: 0;
    padding-bottom: 0;
    max-width: 120rem;
    margin: 0 auto;
    padding: 8rem var(--gap);
    nav {
      ul {
        display: flex;
        list-style: none;
        li {
          padding: 10px;
          a {
            text-decoration: none;
            color: ${(props) => props.theme.black};
            display: block;
            padding: 1rem;
            position: relative;

            &::after {
              content: '';
              position: absolute;
              bottom: 1rem;
              left: 50%;
              width: 0%;
              height: 0.2rem;
              background: ${(props) => props.theme['blue-primary']};
              transition: all 300ms ease-in-out;
              top: 75%;
            }

            &:hover::after {
              width: 70%;
              left: 15%;
            }
          }
        }
      }
    }
  }
`

export const InitialOptions = styled.div`
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
