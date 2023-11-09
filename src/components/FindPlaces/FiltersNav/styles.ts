import styled from 'styled-components'

export const FilterNav = styled.div`
  display: flex;
  justify-content: space-evenly;
  list-style: disc;
  padding: 3rem 3rem 1rem 3rem;
  li {
    padding: 1rem 1rem;
    button {
      background-color: transparent;
      border: none;
      color: ${(props) => props.theme.black};
      font-size: 1.5rem;
      border-bottom: 1px solid ${(props) => props.theme.black};
      &:hover {
        cursor: pointer;
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
      border: 1px solid ${(props) => props.theme['blue-primary']};
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
