module Web.View.Candidates.Edit where
import Web.View.Prelude

data EditView = EditView { candidate :: Candidate }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CandidatesAction}>Candidates</a></li>
                <li class="breadcrumb-item active">Edit Candidate</li>
            </ol>
        </nav>
        <h1>Edit Candidate</h1>
        {renderForm candidate}
    |]

renderForm :: Candidate -> Html
renderForm candidate = formFor candidate [hsx|
    {(textField #name)}
    {(textField #email)}
    {(textField #skills)}
    {(textField #profile)}
    {(textField #education)}
    {(textField #city)}
    {(textField #country)}
    {(textField #linkedin)}
    {(textField #github)}
    {(textField #englishLevel)}
    {(textField #status)}
    {(textareaField #comments)}
    {submitButton}
|]
