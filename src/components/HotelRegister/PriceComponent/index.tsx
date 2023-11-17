import React, { ChangeEvent, useState } from 'react'

interface CurrencyInputProps {
  value: number
  onChange: (value: number) => void
}

const CurrencyInput: React.FC<CurrencyInputProps> = ({ value, onChange }) => {
  const formatCurrency = (value: string) => {
    // Remove caracteres não numéricos
    const numericValue = value.replace(/[^0-9]/g, '')

    // Formata o valor como uma quantia de dinheiro
    const formattedValue = new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL',
      minimumFractionDigits: 2,
    }).format(parseInt(numericValue) / 100)

    return formattedValue
  }

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const inputValue = event.target.value
    const formattedValue = formatCurrency(inputValue)

    // Atualiza o estado local e chama a função onChange com o valor numérico
    setDisplayValue(formattedValue)
    onChange(parseInt(inputValue.replace(/\D/g, '')) / 100)
  }

  const [displayValue, setDisplayValue] = useState(
    formatCurrency(value.toString()),
  )

  return (
    <input
      type="text"
      value={displayValue}
      onChange={handleChange}
      placeholder="R$0,00"
      id="dailyPrice"
      name="dailyPrice"
    />
  )
}

export default CurrencyInput
