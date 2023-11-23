import styled from 'styled-components'

export const FilterNav = styled.div`
  display: flex;
  justify-content: center;
  list-style: disc;
  padding: 5rem 3rem 1rem 3rem;

  .filterButton {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 5rem;
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
