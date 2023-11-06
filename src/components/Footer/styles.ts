import styled from 'styled-components'

export const NewsLatter = styled.div`
  width: 100%;
  height: 10rem;
  background-color: ${(props) => props.theme['background-gray']};
  display: flex;
  justify-content: center;
  align-items: center;

  .newslatterlabel {
    h4 {
      font-size: 1.8rem;
      font-weight: 600;
      letter-spacing: 0.1rem;
      margin-right: 2.5rem;
    }
    p {
      font-size: 1.2rem;
    }
  }

  .emailSend {
    display: flex;
    width: 35%;
    form {
      display: flex;
      width: 100%;
    }
    input[type='email'] {
      width: 300%;
      border-radius: 2.6rem;
      border: 0;
      padding: 1rem;
      outline: 0;
    }
    button {
      border: 0;
      background: ${(props) => props.theme['border-gray']};
      padding: 0.7rem;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: -3.2rem;
    }
  }
`

export const FooterContainer = styled.footer`
  width: 100%;
  height: 10rem;
  background-color: ${(props) => props.theme.gray};
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 18rem;

  .infoContainer {
    display: block;

    h4 {
      color: #4086f4;

      font-family: Montserrat;
      font-size: 50px;
      font-style: normal;
      font-weight: 800;
      line-height: normal;
    }
    span {
      color: #fdce63;
      font-family: Montserrat;
      font-size: 50px;
      font-style: normal;
      font-weight: 800;
      line-height: normal;
    }
    p {
      color: #9a9a9a;
      font-family: Montserrat;
      font-size: 15px;
      font-style: normal;
      font-weight: 400;
      line-height: 20px; /* 133.333% */
    }
    .buttons {
      width: 50%;
      margin-top: 1.5rem;
      display: flex;
      justify-content: space-between;
      button {
        border-radius: 6px;
        background: #e0e2e6;
        outline: 0;
        border: 0;
        padding: 1rem;
        display: flex;
        align-items: center;
        margin: 0 1rem 0 0;
        img {
          padding: 0 0.5rem 0 0;
        }
      }
    }
  }
  .companyList {
    p {
      color: #484848;
      font-family: Montserrat;
      font-size: 18px;
      font-style: normal;
      font-weight: 700;
      line-height: 20px; /* 111.111% */
    }
    ul {
      padding: 1rem 0;
      li {
        list-style: none;
        padding: 0.3rem;
        font-size: 1.2rem;
      }
    }
  }
  .helpList {
    p {
      color: #484848;
      font-family: Montserrat;
      font-size: 18px;
      font-style: normal;
      font-weight: 700;
      line-height: 20px; /* 111.111% */
    }
    ul {
      padding: 1rem 0;
      li {
        list-style: none;
        padding: 0.3rem;
        font-size: 1.2rem;
      }
    }
  }
  .contactInfoList {
    p {
      color: #484848;
      font-family: Montserrat;
      font-size: 18px;
      font-style: normal;
      font-weight: 700;
      line-height: 20px; /* 111.111% */
    }
    ul {
      padding: 1rem 0;
      li {
        list-style: none;
        padding: 0.3rem;
        font-size: 1.2rem;
      }
      .icons {
        margin-top: 1rem;
        img {
          padding: 0.5rem;
        }
      }
    }
  }
`
