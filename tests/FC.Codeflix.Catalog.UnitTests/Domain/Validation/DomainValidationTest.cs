using Bogus;
using FC.Codeflix.Catalog.Domain.Exceptions;
using FC.Codeflix.Catalog.Domain.Validation;
using FluentAssertions;

namespace FC.Codeflix.Catalog.UnitTests.Domain.Validation
{
    [Collection(nameof(DomainValidationTestFixture))]
    public class DomainValidationTest
    {

        private readonly DomainValidationTestFixture _domainValidationTestFixture;

        public DomainValidationTest(DomainValidationTestFixture domainValidationTestFixture)
        {
            _domainValidationTestFixture = domainValidationTestFixture;
        }

        public Faker Faker { get; set; } = new Faker();
        
        [Fact(DisplayName = "DomainValidation NotNullOK")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        public void Validar_Domain_NomeNaoDeveSerNulo()
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            var value = Faker.Commerce.ProductName();
            Action action = 
                () => DomainValidation.NotNull(value, fieldColumn);
            action.Should().NotThrow();
        }

        [Fact(DisplayName = "DomainValidation NotNullError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        public void Validar_Domain_NomeDeveSerNulo()
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            string? value = null;
            Action action =
                () => DomainValidation.NotNull(value, fieldColumn);
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage($"{fieldColumn} should not be null");
        }

        [Theory(DisplayName = "DomainValidation NotNullOrEmptyError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        [InlineData("")]
        [InlineData("  ")]
        [InlineData(null)]
        public void Validar_Domain_NomeDeveSerNuloOuVazio(string? target)
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            Action action =
                () => DomainValidation.NotNullOrEmpty(target, fieldColumn);
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage($"{fieldColumn} should not be empty or null");
        }

        [Fact(DisplayName = "DomainValidation NotNullOrEmptyOK")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        public void Validar_Domain_NomeNaoDeveSerNuloOuVazio()
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            var value = Faker.Commerce.ProductName();
            Action action =
                () => DomainValidation.NotNullOrEmpty(value, fieldColumn);
            action.Should().NotThrow();
        }

        [Theory(DisplayName = "DomainValidation MinLengthError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        [MemberData(nameof(GetValidar_Domain_DeveObterValorMenorQueOMinimo), parameters:10)]
        public void Validar_Domain_NomeDeveSerMenorQue3Caracteres(string target, int minLength)
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            Action action =
                () => DomainValidation.MinLength(target, minLength, fieldColumn);
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage($"{fieldColumn} should be at leats {minLength} caracters long");
        }

        public static IEnumerable<object[]> GetValidar_Domain_DeveObterValorMenorQueOMinimo(int numberOfTests = 5)
        {
            yield return new object[] { "123456", 10 };
            var faker = new Faker();
            for (int i = 0; i < (numberOfTests - 1); i++)
            {
                var example = faker.Commerce.ProductName();
                var minLength = example.Length + new Random().Next(1, 20);
                yield return new object[] { example, minLength };
            }
        }

        [Theory(DisplayName = "DomainValidation MinLengthNotError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        [MemberData(nameof(GetValidar_Domain_DeveObterValorMaiorQueOMinimo), parameters: 10)]
        public void Validar_Domain_NomeNaoDeveSerMenorQue3Caracteres(string target, int minLength)
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            Action action =
                () => DomainValidation.MinLength(target, minLength, fieldColumn);
            action.Should().NotThrow();
        }

        public static IEnumerable<object[]> GetValidar_Domain_DeveObterValorMaiorQueOMinimo(int numberOfTests = 2)
        {
            yield return new object[] { "123456", 5 };
            var faker = new Faker();
            for (int i = 0; i < (numberOfTests - 1); i++)
            {
                var example = faker.Commerce.ProductName();
                var minLength = example.Length - new Random().Next(1, 5);
                yield return new object[] { example, minLength };
            }
        }

        [Theory(DisplayName = "DomainValidation MaxLengthError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        [MemberData(nameof(GetValidar_Domain_DeveObterValorMaiorQueOMaximo), parameters: 10)]
        public void Validar_Domain_NomeDeveSerMaiorQue255Caracteres(string target, int maxLength)
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            Action action =
                () => DomainValidation.MaxLength(target, maxLength, fieldColumn);
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage($"{fieldColumn} should be less or equal {maxLength} caracteres");
        }

        public static IEnumerable<object[]> GetValidar_Domain_DeveObterValorMaiorQueOMaximo(int numberOfTests = 5)
        {
            yield return new object[] { "123456", 5 };
            var faker = new Faker();
            for (int i = 0; i < (numberOfTests - 1); i++)
            {
                var example = faker.Commerce.ProductName();
                var maxLength = example.Length - new Random().Next(1, 5);
                yield return new object[] { example, maxLength };
            }
        }

        [Theory(DisplayName = "DomainValidation MaxLengthNotError")]
        [Trait("Domain", "DomainValidation Trait Tests")]
        [MemberData(nameof(GetValidar_Domain_DeveObterValorMenorQueOMaximo), parameters: 10)]
        public void Validar_Domain_NomeNaoDeveSerMaiorQue255Caracteres(string target, int maxLength)
        {
            var fieldColumn = _domainValidationTestFixture.GetValidDomainValidationFieldColumn();
            Action action =
                () => DomainValidation.MaxLength(target, maxLength, fieldColumn);
            action.Should().NotThrow();
        }

        public static IEnumerable<object[]> GetValidar_Domain_DeveObterValorMenorQueOMaximo(int numberOfTests = 2)
        {
            yield return new object[] { "123456", 10 };
            var faker = new Faker();
            for (int i = 0; i < (numberOfTests - 1); i++)
            {
                var example = faker.Commerce.ProductName();
                var maxLength = example.Length + new Random().Next(1, 5);
                yield return new object[] { example, maxLength };
            }
        }
    }
}
