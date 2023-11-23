import styled from 'styled-components'

export const FilterNav = styled.div`
  display: flex;
  justify-content: space-evenly;
  list-style: disc;
  padding: 3rem 3rem 1rem 3rem;

  ul {
    width: 25%;
    li {
      display: inline-block;
      margin: 1rem 3rem;

      &:hover {
        cursor: pointer;
      }
      a {
        text-decoration: none;
        color: ${(props) => props.theme.black};
        display: block;
        text-decoration: none;
        position: relative;
        margin-top: 0.8rem;
        font-size: 1.5rem;
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
          cursor: pointer;
        }
      }
    }
  }
  .filterButton {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 60rem;
    button {
      background-color: transparent;
      border: 1px solid ${(props) => props.theme.black};
      font-size: 1.8rem;
      padding: 0.5rem 1rem;
      border-radius: 2rem;
      img {
        margin-right: 0.8rem;
        margin-bottom: -0.1rem;
      }
    }
  }
`
