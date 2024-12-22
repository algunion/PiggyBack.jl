using HTMLForge

abstract type DaisyColor end
struct DaisyPrimaryColor <: DaisyColor end
struct DaisyPrimaryContentColor <: DaisyColor end
struct DaisySecondaryColor <: DaisyColor end
struct DaisySecondaryContentColor <: DaisyColor end
struct DaisyAccentColor <: DaisyColor end
struct DaisyAccentContentColor <: DaisyColor end
struct DaisyNeutralColor <: DaisyColor end
struct DaisyNeutralContentColor <: DaisyColor end
struct DaisyBase100Color <: DaisyColor end
struct DaisyBase200Color <: DaisyColor end
struct DaisyBase300Color <: DaisyColor end
struct DaisyBaseContentColor <: DaisyColor end
struct DaisyInfoColor <: DaisyColor end
struct DaisyInfoContentColor <: DaisyColor end
struct DaisySuccessColor <: DaisyColor end
struct DaisySuccessContentColor <: DaisyColor end
struct DaisyWarningColor <: DaisyColor end
struct DaisyWarningContentColor <: DaisyColor end
struct DaisyErrorColor <: DaisyColor end
struct DaisyErrorContentColor <: DaisyColor end

function ascssclass(::Union{Type{DaisyPrimaryColor},DaisyPrimaryColor})
    return "primary"
end
function ascssclass(::Union{Type{DaisyPrimaryContentColor},DaisyPrimaryContentColor})
    return "primary-content"
end
function ascssclass(::Union{Type{DaisySecondaryColor},DaisySecondaryColor})
    return "secondary"
end
function ascssclass(::Union{Type{DaisySecondaryContentColor},DaisySecondaryContentColor})
    return "secondary-content"
end
function ascssclass(::Union{Type{DaisyAccentColor},DaisyAccentColor})
    return "accent"
end
function ascssclass(::Union{Type{DaisyAccentContentColor},DaisyAccentContentColor})
    return "accent-content"
end
function ascssclass(::Union{Type{DaisyNeutralColor},DaisyNeutralColor})
    return "neutral"
end
function ascssclass(::Union{Type{DaisyNeutralContentColor},DaisyNeutralContentColor})
    return "neutral-content"
end
function ascssclass(::Union{Type{DaisyBase100Color},DaisyBase100Color})
    return "base-100"
end
function ascssclass(::Union{Type{DaisyBase200Color},DaisyBase200Color})
    return "base-200"
end
function ascssclass(::Union{Type{DaisyBase300Color},DaisyBase300Color})
    return "base-300"
end
function ascssclass(::Union{Type{DaisyBaseContentColor},DaisyBaseContentColor})
    return "base-content"
end
function ascssclass(::Union{Type{DaisyInfoColor},DaisyInfoColor})
    return "info"
end
function ascssclass(::Union{Type{DaisyInfoContentColor},DaisyInfoContentColor})
    return "info-content"
end
function ascssclass(::Union{Type{DaisySuccessColor},DaisySuccessColor})
    return "success"
end
function ascssclass(::Union{Type{DaisySuccessContentColor},DaisySuccessContentColor})
    return "success-content"
end
function ascssclass(::Union{Type{DaisyWarningColor},DaisyWarningColor})
    return "warning"
end
function ascssclass(::Union{Type{DaisyWarningContentColor},DaisyWarningContentColor})
    return "warning-content"
end
function ascssclass(::Union{Type{DaisyErrorColor},DaisyErrorColor})
    return "error"
end
function ascssclass(::Union{Type{DaisyErrorContentColor},DaisyErrorContentColor})
    return "error-content"
end

abstract type DaisySize end
struct DaisyExtraSmallSize <: DaisySize end
struct DaisySmallSize <: DaisySize end
struct DaisyMediumSize <: DaisySize end
struct DaisyLargeSize <: DaisySize end
struct DaisyExtraLargeSize <: DaisySize end

function ascssclass(::Union{Type{DaisyExtraSmallSize},DaisyExtraSmallSize})
    return "xs"
end
function ascssclass(::Union{Type{DaisySmallSize},DaisySmallSize})
    return "sm"
end
function ascssclass(::Union{Type{DaisyMediumSize},DaisyMediumSize})
    return "md"
end
function ascssclass(::Union{Type{DaisyLargeSize},DaisyLargeSize})
    return "lg"
end

abstract type DaisyComponent end

struct DaisyButton <: DaisyComponent
    text::String
    color::Type{<:DaisyColor}
    size::Type{<:DaisySize}
    outline::Bool
    glass::Bool
    wide::Bool
    block::Bool
    circle::Bool
    square::Bool
end

StructType{::Type{DaisyButton}} = StructTypes.Struct()

DaisyButton(text) = DaisyButton(text, DaisyPrimaryColor, DaisyMediumSize, false, false, false, false, false, false)

function ashtml(d::DaisyButton)
    classes = "btn-$(ascssclass(d.color)) btn-$(ascssclass(d.size))"
    if d.glass
        classes *= " glass"
    end
    if d.wide
        classes *= " btn-wide"
    end
    if d.block
        classes *= " btn-block"
    end
    if d.circle
        classes *= " btn-circle"
    end
    if d.square
        classes *= " btn-square"
    end
    attributes = Dict{AbstractString,AbstractString}("class" => classes)
    HTMLElement(:button, HTMLText(d.text), attributes)
end




