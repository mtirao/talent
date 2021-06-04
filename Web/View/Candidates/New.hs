module Web.View.Candidates.New where
import Web.View.Prelude

data NewView = NewView { candidate :: Candidate }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CandidatesAction}>Candidates</a></li>
                <li class="breadcrumb-item active">New Candidate</li>
            </ol>
        </nav>
        <h1>New Candidate</h1>
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
